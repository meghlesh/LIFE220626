// ==========================================
// CWS LIFE — ADMIN AUTH JS
// ==========================================

// ── Auth Check + Profile ──
(function() {
  var userStr = localStorage.getItem('user');
  if (!userStr) {
    window.location.replace('Sign-In.html');
    return;
  }
  var userData;
  try {
    userData = JSON.parse(userStr);
  } catch(e) {
    localStorage.removeItem('user');
    window.location.replace('Sign-In.html');
    return;
  }
  if (!userData.token || userData.role !== 'SUPER_ADMIN') {
    localStorage.removeItem('user');
    window.location.replace('Sign-In.html');
    return;
  }
  var name     = userData.name || 'Admin';
  var parts    = name.trim().split(' ');
  var initials = parts.length >= 2
    ? (parts[0][0] + parts[1][0]).toUpperCase()
    : name.substring(0, 2).toUpperCase();
  var profileBtn = document.getElementById('profileBtn');
  if (profileBtn) profileBtn.textContent = initials;
})();

// ── Logout ──
function handleLogout() {
  localStorage.removeItem('user');
  localStorage.removeItem('creative_email');
  localStorage.removeItem('creative_remember');
  window.location.replace('Sign-In.html');
}

// ── Sidebar + Profile Dropdown ──
document.addEventListener('DOMContentLoaded', function() {

  // Hamburger
  var hamburger = document.querySelector('.hamburger');
  var closeBtn  = document.querySelector('.close-btn');
  var sidebar   = document.querySelector('.sidebar');
  if (hamburger) {
    hamburger.addEventListener('click', function() {
      sidebar.classList.add('active');
    });
  }
  if (closeBtn) {
    closeBtn.addEventListener('click', function() {
      sidebar.classList.remove('active');
    });
  }

  // Profile Dropdown
  var profileBtn      = document.getElementById('profileBtn');
  var dropdownWrapper = document.querySelector('.profile-dropdown-wrapper');
  if (profileBtn && dropdownWrapper) {
    profileBtn.addEventListener('click', function(e) {
      e.stopPropagation();
      dropdownWrapper.classList.toggle('active');
    });
    document.addEventListener('click', function(e) {
      if (!dropdownWrapper.contains(e.target)) {
        dropdownWrapper.classList.remove('active');
      }
    });
  }

});