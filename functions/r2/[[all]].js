const ALLOW_LIST = ["alejandro_fernandez_cv-en.pdf"];

function authorizeRequest(key) {
  return ALLOW_LIST.includes(key);
}

export async function onRequestHead(context) {
  const path = new URL(context.request.url).pathname.replace("/r2/", "");

  return authorizeRequest(path)
    ? new Response(null, { status: 200 })
    : new Response(null, { status: 404 });
}

export async function onRequestGet(context) {
  const path = new URL(context.request.url).pathname.replace("/r2/", "");

  if (!authorizeRequest(path)) {
    return new Response(null, { status: 404 });
  }

  const file = await context.env.R2_CV.get(path);
  if (!file) return new Response(null, { status: 404 });
  return new Response(file.body, {
    headers: { "Content-Type": file.httpMetadata.contentType },
  });
}
