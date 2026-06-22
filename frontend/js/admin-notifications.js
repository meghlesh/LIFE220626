// ==========================================
// CWS LIFE — ADMIN NOTIFICATION JS
// ==========================================

document.addEventListener('DOMContentLoaded', function() {

  var notifyBtn     = document.getElementById('notifyBtn');
  var notifyWrapper = document.querySelector('.notification-dropdown-wrapper');
  var notifyList    = document.getElementById('notifyList');
  var notifyBadge   = document.querySelector('.notification-dropdown-wrapper .badge');

  if (!notifyBtn) return;

  var notifications = [];
  var contactNotifications = [];
  var careerNotifications = [];

  function renderNotifications() {
    if (!notifyList) return;
    notifyList.innerHTML = '';
    if (notifications.length === 0) {
      notifyList.innerHTML = '<li class="notify-item"><div class="notify-content"><span class="notify-msg">No new notifications</span></div></li>';
      if (notifyBadge) notifyBadge.style.display = 'none';
      return;
    }
    notifications.forEach(function(notif) {
      var li = document.createElement('li');
      li.className = 'notify-item';
      li.style.cursor = 'pointer';
      var icon = notif.type === 'career' ? 'fa-briefcase' : 'fa-envelope';
      var color = notif.type === 'career' ? '#6366F1' : '#0796FE';
      li.innerHTML =
        '<div class="notify-icon" style="background-color:' + color + '20; color:' + color + '">' +
          '<i class="fa-solid ' + icon + '"></i>' +
        '</div>' +
        '<div class="notify-content">' +
          '<span class="notify-msg">' + notif.text + '</span>' +
          '<span class="notify-time">' + notif.time + '</span>' +
        '</div>';
      li.addEventListener('click', function() { markReadAndRedirect(notif.id, notif.type); });
      notifyList.appendChild(li);
    });
    if (notifyBadge) {
      notifyBadge.textContent = notifications.length;
      notifyBadge.style.display = 'flex';
    }
  }

  notifyBtn.addEventListener('click', function(e) {
    e.stopPropagation();
    var profileWrapper = document.querySelector('.profile-dropdown-wrapper');
    if (profileWrapper) profileWrapper.classList.remove('active');
    if (notifyWrapper) notifyWrapper.classList.toggle('active');
  });

  document.addEventListener('click', function(e) {
    if (notifyWrapper && !notifyWrapper.contains(e.target)) {
      notifyWrapper.classList.remove('active');
    }
  });

  function loadContactNotifications() {
    fetch('https://api-lifeqa-be.azurewebsites.net/api/contact/notifications')
    .then(function(res) { return res.json(); })
    .then(function(data) {
      contactNotifications  = (data.notifications || []).map(function(notif) {
        var name = (notif.firstName && notif.lastName)
          ? notif.firstName + ' ' + notif.lastName
          : notif.firstName || notif.name || 'Someone';
        var timeStr = notif.time || notif.createdAt || '';
        if (timeStr && timeStr.length > 10 && !timeStr.includes('ago')) {
          var d = new Date(timeStr);
          if (!isNaN(d)) {
            timeStr = d.toLocaleDateString('en-IN') + ' ' +
                      d.toLocaleTimeString('en-IN', {hour:'2-digit', minute:'2-digit'});
          }
        }
        return { id: notif.id, type: 'contact', text: name + ' sent a message.', time: timeStr };
      });
      notifications = [...careerNotifications, ...contactNotifications];
      notifications.sort((a, b) => new Date(b.time) - new Date(a.time));
      renderNotifications();
    })
    .catch(function(err) {
      console.log('Notification Error:', err);
      renderNotifications();
    });
  }

    //Career notification
   function loadCareerNotifications() {
     fetch('https://api-lifeqa-be.azurewebsites.net/api/apply/notifications')
       .then(function(res) {
        return res.json();
      })
      .then(function(data) {

      careerNotifications  = (data.notifications || []).map(function(notif) {

        var timeStr = notif.time || notif.createdAt || '';

        if (timeStr && timeStr.length > 10 && !timeStr.includes('ago')) {
          var d = new Date(timeStr);
          if (!isNaN(d)) {
            timeStr =
              d.toLocaleDateString('en-IN') + ' ' +
              d.toLocaleTimeString('en-IN', {
                hour: '2-digit',
                minute: '2-digit'
              });
          }
        }

        return {
          id: notif.id,
          type: 'career',
          text: notif.message,
          time: timeStr
        };
      });
      notifications = [...careerNotifications, ...contactNotifications];
      notifications.sort((a, b) => new Date(b.time) - new Date(a.time));
      renderNotifications();
    })
    .catch(function(err) {
      console.log('Career Notification Error:', err);
      renderNotifications();
    });
}
  loadCareerNotifications();
  loadContactNotifications();
});



function markReadAndRedirect(id, type) {
  var url = type === 'career' ? 'career-panel.html' : 'admin-contact-us.html';
  var api =
  type === 'career'
    ? 'https://api-lifeqa-be.azurewebsites.net/api/apply/read/' + id
    : 'https://api-lifeqa-be.azurewebsites.net/api/contact/read/' + id;
    fetch(api, { method: 'PUT' })
  .then(function() { window.location.href = url; })
  .catch(function() { window.location.href = url; });
}

function markAllAsRead() {
  Promise.all([
  fetch('https://api-lifeqa-be.azurewebsites.net/api/contact/read-all', { method: 'PUT' }),
  fetch('https://api-lifeqa-be.azurewebsites.net/api/apply/read-all', { method: 'PUT' })
  ])
  .then(function() {
    var notifyList  = document.getElementById('notifyList');
    var notifyBadge = document.querySelector('.notification-dropdown-wrapper .badge');
    var notifyWrapper = document.querySelector('.notification-dropdown-wrapper');
    if (notifyList) notifyList.innerHTML = '<li class="notify-item"><div class="notify-content"><span class="notify-msg">No new notifications</span></div></li>';
    if (notifyBadge) notifyBadge.style.display = 'none';
    if (notifyWrapper) notifyWrapper.classList.remove('active');
  })
  .catch(function(err) { console.log(err); });
}