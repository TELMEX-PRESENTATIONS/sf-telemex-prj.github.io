# Portal de Presentaciones — Telmex TAC

Portal de presentaciones técnicas del proyecto **Telmex TAC · Salesforce Communications Cloud**, organizado por categorías y publicado vía GitHub Pages.

**URL del portal:**
```
https://telmex-presentations.github.io/sf-telemex-prj.github.io/
```

---

## Estructura del repositorio

```
/
├── index.html                          ← Landing page (no modificar)
├── sync-portal.sh                      ← Script de sincronización
│
├── canales-digitales/
│   ├── index.html                      ← Índice de la categoría
│   └── 2026-10-07-arquitecturas/
│       ├── index.html                  ← Índice de la presentación
│       └── *.html                      ← Artefactos individuales
│
├── ventas/
├── post-ventas/
├── catalogo/
└── co-living/
```

---

## Cómo publicar una nueva presentación

### Paso 1 — Clonar el repositorio (solo la primera vez)

```bash
git clone https://github.com/TELMEX-PRESENTATIONS/sf-telemex-prj.github.io.git
cd sf-telemex-prj.github.io
```

### Paso 2 — Crear la carpeta de la presentación

El nombre de la carpeta sigue el formato `YYYY-MM-DD-<tema>`:

```bash
mkdir -p canales-digitales/2026-11-15-nueva-presentacion
```

Usa la categoría correspondiente (`ventas/`, `post-ventas/`, `catalogo/`, `co-living/`).

### Paso 3 — Copiar los archivos HTML

Copia los HTMLs que quieras publicar dentro de la carpeta creada:

```bash
cp /ruta/a/tu/archivo.html canales-digitales/2026-11-15-nueva-presentacion/
```

Si trabajas en el repo `telmex-adp`, puedes usar el script `sync-portal.sh` para los artefactos estándar:

```bash
./sync-portal.sh
```

### Paso 4 — Crear el índice de la presentación

Dentro de la carpeta de la presentación, crea un archivo `index.html`.
La forma más fácil es copiar el `index.html` de una presentación existente y editarlo:

```bash
cp canales-digitales/2026-10-07-arquitecturas/index.html \
   canales-digitales/2026-11-15-nueva-presentacion/index.html
```

Luego edítalo cambiando:
- El título y descripción en la sección `<h1>` y `<p class="page-sub">`
- Las tarjetas (cards) con los nombres y rutas de tus nuevos archivos
- Las migas de pan (breadcrumb) con la ruta correcta

### Paso 5 — Actualizar el índice de la categoría

Abre `canales-digitales/index.html` (o la categoría que corresponda) y agrega una nueva tarjeta para tu presentación. Copia el bloque `<a class="card" ...>` existente y ajusta el título, descripción, fecha y número de artefactos.

También actualiza el contador en `index.html` raíz si cambia el número de presentaciones en la categoría.

### Paso 6 — Commit y push

```bash
git add -A
git status                     # Verifica que los archivos correctos están staged
git commit -m "feat: agrega presentación <tema> en <categoría>"
git push
```

GitHub Pages publica automáticamente en ~1 minuto tras el push.

---

## Activar GitHub Pages (solo la primera vez por repo)

1. Ir a `https://github.com/TELMEX-PRESENTATIONS/sf-telemex-prj.github.io` → **Settings**
2. Menú izquierdo → **Pages**
3. En *Build and deployment*:
   - **Source:** `Deploy from a branch`
   - **Branch:** `main` | carpeta `/ (root)`
   - Clic en **Save**

La URL activa en ~2 minutos.

---

## Convención de nombres de carpetas

| Categoría       | Ruta base         | Ejemplo                                      |
|-----------------|-------------------|----------------------------------------------|
| Canales Digitales | `canales-digitales/` | `canales-digitales/2026-10-07-arquitecturas` |
| Ventas          | `ventas/`         | `ventas/2026-11-01-flujo-venta-nueva`        |
| Post-Ventas     | `post-ventas/`    | `post-ventas/2026-11-10-gestion-casos`       |
| Catálogo        | `catalogo/`       | `catalogo/2026-12-01-pcm-demo`               |
| Co-Living       | `co-living/`      | `co-living/2027-01-15-arquitectura`          |

Siempre usar `YYYY-MM-DD-<tema-en-kebab-case>` para mantener orden cronológico.

---

## Preguntas frecuentes

**¿Cuánto tarda en publicarse tras el push?**
GitHub Pages tarda entre 30 segundos y 2 minutos. Si no actualiza, haz hard-refresh (`Ctrl+Shift+R` / `Cmd+Shift+R`).

**¿Puedo subir PDFs o imágenes además de HTMLs?**
Sí. Súbelos a la misma carpeta de la presentación y agrégalos como tarjeta en el `index.html` local con `<a href="archivo.pdf" target="_blank">`.

**¿Cómo actualizo un HTML que ya está publicado?**
Reemplaza el archivo, haz `git add <archivo> && git commit -m "update: ..." && git push`. Se actualiza automáticamente.

**¿Cómo agrego una nueva categoría?**
1. Crea la carpeta: `mkdir nueva-categoria`
2. Copia y adapta un `index.html` de categoría existente
3. Agrega la tarjeta correspondiente en el `index.html` raíz (quita el `disabled` de la clase del `<div>` y cambia a `<a class="card active" href="nueva-categoria/index.html">`)
4. Commit y push
