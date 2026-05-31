/* =============================================================
   startpage / script.js
   - Live clock + date
   - Visit tracking (count + last visit) stored in localStorage
   - Favicon error → letter fallback
   ============================================================= */

(function () {
  'use strict';

  /* ── Storage key prefix ──────────────────────────────────── */
  const STORE_PREFIX = 'sp_visit_';

  /* ── Helpers ─────────────────────────────────────────────── */
  function domainKey(url) {
    try {
      return new URL(url).hostname.replace(/^www\./, '');
    } catch {
      return url;
    }
  }

  function loadVisit(key) {
    try {
      const raw = localStorage.getItem(STORE_PREFIX + key);
      return raw ? JSON.parse(raw) : null;
    } catch { return null; }
  }

  function saveVisit(key) {
    const current = loadVisit(key) || { count: 0, last: null };
    current.count += 1;
    current.last = new Date().toISOString();
    try {
      localStorage.setItem(STORE_PREFIX + key, JSON.stringify(current));
    } catch { /* quota exceeded – silently ignore */ }
  }

  /* ── Relative time formatter ─────────────────────────────── */
  function relativeTime(isoString) {
    if (!isoString) return null;
    const diff = Date.now() - new Date(isoString).getTime();
    const mins  = Math.floor(diff / 60000);
    const hours = Math.floor(diff / 3600000);
    const days  = Math.floor(diff / 86400000);
    const weeks = Math.floor(days / 7);
    const months = Math.floor(days / 30);

    if (mins  < 1)   return 'just now';
    if (mins  < 60)  return `${mins}m ago`;
    if (hours < 24)  return `${hours}h ago`;
    if (days  < 7)   return `${days}d ago`;
    if (weeks < 5)   return `${weeks}w ago`;
    if (months < 12) return `${months}mo ago`;
    return `${Math.floor(months / 12)}y ago`;
  }

  /* ── Render visit meta into each .link-meta span ─────────── */
  function renderMeta() {
    document.querySelectorAll('.link-meta[data-key]').forEach(el => {
      const key  = el.dataset.key;
      const data = loadVisit(key);
      if (!data) {
        el.textContent = '';
        return;
      }
      el.classList.add('has-data');
      const visitWord = data.count === 1 ? 'visit' : 'visits';
      const timeStr   = relativeTime(data.last);

      el.innerHTML =
        `<span class="visits">${data.count} ${visitWord}</span>` +
        (timeStr ? `<span>${timeStr}</span>` : '');
    });
  }

  /* ── Footer total visits ─────────────────────────────────── */
  function renderFooter() {
    const totalEl = document.getElementById('total-visits');
    if (!totalEl) return;

    let total = 0;
    for (let i = 0; i < localStorage.length; i++) {
      const k = localStorage.key(i);
      if (k && k.startsWith(STORE_PREFIX)) {
        try {
          const d = JSON.parse(localStorage.getItem(k));
          if (d && typeof d.count === 'number') total += d.count;
        } catch { /* skip */ }
      }
    }
    totalEl.textContent = total > 0 ? `${total} total clicks tracked` : '';
  }

  /* ── Intercept link clicks to record visits ──────────────── */
  function attachClickTrackers() {
    document.querySelectorAll('ul li a[data-url]').forEach(anchor => {
      anchor.addEventListener('click', function () {
        const key = domainKey(this.dataset.url);
        saveVisit(key);
        // Re-render meta immediately so it updates if user comes back
        setTimeout(() => { renderMeta(); renderFooter(); }, 50);
      });
    });
  }

  /* ── Favicon fallback: letter avatar if img fails ─────────── */
  function attachFaviconFallbacks() {
    document.querySelectorAll('img.favicon').forEach(img => {
      img.addEventListener('error', function () {
        const anchor = this.closest('a');
        const text   = anchor
          ? (anchor.querySelector('.link-text') || anchor).textContent.trim()
          : '?';
        const letter = text.charAt(0).toUpperCase();

        const fallback = document.createElement('span');
        fallback.className = 'favicon-fallback';
        fallback.textContent = letter;
        fallback.setAttribute('aria-hidden', 'true');

        this.replaceWith(fallback);
      }, { once: true });
    });
  }

  /* ── Live clock ──────────────────────────────────────────── */
  function startClock() {
    const clockEl = document.getElementById('clock');
    const dateEl  = document.getElementById('date-str');
    if (!clockEl && !dateEl) return;

    const days   = ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'];
    const months = ['Jan','Feb','Mar','Apr','May','Jun',
                    'Jul','Aug','Sep','Oct','Nov','Dec'];

    function tick() {
      const now = new Date();
      const hh  = String(now.getHours()).padStart(2, '0');
      const mm  = String(now.getMinutes()).padStart(2, '0');
      const ss  = String(now.getSeconds()).padStart(2, '0');

      if (clockEl) clockEl.textContent = `${hh}:${mm}:${ss}`;

      if (dateEl) {
        dateEl.textContent =
          `${days[now.getDay()]} ${now.getDate()} ${months[now.getMonth()]} ${now.getFullYear()}`;
      }
    }

    tick();
    setInterval(tick, 1000);
  }

  /* ── Init ────────────────────────────────────────────────── */
  function init() {
    startClock();
    attachFaviconFallbacks();
    attachClickTrackers();
    renderMeta();
    renderFooter();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }

})();
