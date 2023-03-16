export default async function subscribe(req, res) {
  const response = await fetch("https://api.parcel.io/important-tips", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      email: req.body.email,
      source: "howtotarget",
    }),
  });

  let data = {};
  try {
    data = await response.json();
  } catch {
    // do nothing if the response isn't json
  }

  res.status(response.status).json(data);
}
