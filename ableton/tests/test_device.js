/* The Max for Live device, run in Node on a pretend Max and a pretend Live.
 *   python3 ableton/kit/build.py ableton/device.json && node --test ableton/tests/ */
'use strict';
const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const path = require('node:path');
const suite = require('../kit/test/audio_suite.js');
const { compare } = require('../kit/test/gen_compare.js');
require('../kit/test/palette_suite.js')();

const ROOT = path.join(__dirname, '..', '..');
const JSFX = path.join(ROOT, 'ReeseBasser.jsfx');
suite({ bundle: path.join(__dirname, '..', 'ReeseBasser.js'), maxpat: path.join(__dirname, '..', 'ReeseBasser.maxpat'),
        jsfx: JSFX, name: 'Reese Basser', window: [960, 684], memory: 262144, instrument: true, vary: 1 });

test('every engine sounds in gen~ as it does in the runtime', () => {
  const text = fs.readFileSync(JSFX, 'utf8');
  const notes = [[0, 0x90, 36, 110], [9000, 0x80, 36, 0], [10000, 0x90, 43, 90]];
  for (let e = 0; e <= 7; e++) {
    const r = compare(text, { seconds: 0.4, midi: notes, sliders: { 1: e }, memory: 262144 });
    assert.ok(r.worst < 1e-6 && r.peak > 0.01, 'engine ' + e + ': worst ' + r.worst + ' at ' + r.at + ', peak ' + r.peak);
  }
});
