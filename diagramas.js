const segmentosDER = Array.from({ length: 11 }, (_, i) => `assets/der-${String(i).padStart(2, "0")}.txt`);
const segmentosRelacional = Array.from({ length: 9 }, (_, i) => `assets/rel-${String(i).padStart(2, "0")}.txt`);

async function reconstruirDiagrama(segmentos) {
  const partes = await Promise.all(segmentos.map(async (ruta) => {
    const respuesta = await fetch(ruta);
    if (!respuesta.ok) throw new Error(`No se pudo cargar ${ruta}`);
    return (await respuesta.text()).trim();
  }));
  return `data:image/jpeg;base64,${partes.join("")}`;
}

window.diagramasListos = Promise.all([
  reconstruirDiagrama(segmentosDER),
  reconstruirDiagrama(segmentosRelacional)
]).then(([der, relacional]) => ({ der, relacional }));

// Publicación consolidada 2026-08-14
