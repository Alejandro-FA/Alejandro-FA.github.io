{{flutter_js}}
{{flutter_build_config}}

window.addEventListener('flutter-first-frame', function () {
  document.getElementById('splash-screen')?.remove();
});

// Load the Flutter app
_flutter.loader.load({
  onEntrypointLoaded: async function (engineInitializer) {
    const appRunner = await engineInitializer.initializeEngine();
    document.querySelector('meta[name="viewport"]')?.remove(); // To avoid warning in console
    await appRunner.runApp();
  },
});
