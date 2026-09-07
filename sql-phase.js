(() => {
  const root = document.querySelector('.sql-actualizacion');
  if (!root) return;
  root.querySelectorAll('[data-sql-filtro]').forEach(button => button.addEventListener('click', () => {
    root.querySelectorAll('[data-sql-filtro]').forEach(item => item.setAttribute('aria-pressed', String(item === button)));
    root.querySelectorAll('[data-sql-grupo]').forEach(item => { item.hidden = button.dataset.sqlFiltro !== 'todos' && button.dataset.sqlFiltro !== item.dataset.sqlGrupo; });
  }));
  const tabs = [...root.querySelectorAll('[data-sql-consulta]')];
  function selectTab(button) {
    tabs.forEach(item => { const active = item === button; item.setAttribute('aria-selected', String(active)); item.tabIndex = active ? 0 : -1; document.getElementById(item.getAttribute('aria-controls')).hidden = !active; });
  }
  tabs.forEach((button, index) => {
    button.addEventListener('click', () => selectTab(button));
    button.addEventListener('keydown', event => {
      let next;
      if (event.key === 'ArrowRight') next = (index + 1) % tabs.length;
      if (event.key === 'ArrowLeft') next = (index + tabs.length - 1) % tabs.length;
      if (event.key === 'Home') next = 0;
      if (event.key === 'End') next = tabs.length - 1;
      if (next !== undefined) { event.preventDefault(); selectTab(tabs[next]); tabs[next].focus(); }
    });
  });
  const dialog = document.getElementById('sql-visor');
  const image = document.getElementById('sql-visor-imagen');
  let scale = 1;
  const resize = () => { image.style.width = `${scale * 100}%`; };
  root.querySelectorAll('[data-sql-imagen]').forEach(button => button.addEventListener('click', () => {
    image.src = button.dataset.sqlImagen;
    image.alt = button.dataset.sqlTitulo;
    document.getElementById('sql-visor-titulo').textContent = button.dataset.sqlTitulo;
    scale = 1; resize(); dialog.showModal(); document.getElementById('sql-cerrar').focus();
  }));
  document.getElementById('sql-cerrar').addEventListener('click', () => dialog.close());
  dialog.addEventListener('click', event => { if (event.target === dialog) dialog.close(); });
  root.querySelectorAll('[data-sql-zoom]').forEach(button => button.addEventListener('click', () => {
    scale = button.dataset.sqlZoom === 'ajustar' ? 1 : Math.max(.5, Math.min(4, scale + (button.dataset.sqlZoom === 'mas' ? .5 : -.5)));
    resize();
  }));
})();
