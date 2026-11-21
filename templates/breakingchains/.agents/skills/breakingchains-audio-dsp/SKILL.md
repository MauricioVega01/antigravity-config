---
name: breakingchains-audio-dsp
description: Builds real measured audio waveforms, spectrum visualization and DSP for BreakingChains; distinguishes preanalysis from live signals.
---

# Audio and real waveforms
- Map existing Web Audio graph, proxy, cache and playback synchronization before any change.
- Use decoded PCM / real analyser samples when available; never fabricate real-looking frequency data.
- Distinguish full-track precomputed 3-band waveform from real-time AnalyserNode visualization.
- Treat CORS and inaccessible streamed samples as explicit unsupported cases, not a reason to fake results.
- Prefer offline cached audio features for local files; test seeking, pause, navigation, mobile and memory cleanup.
- Avoid claiming Pioneer/Rekordbox algorithm equivalence.
