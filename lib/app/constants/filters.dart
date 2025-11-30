final Map<String, String> filters = {
  // Classic looks
  'vivid': 'eq=contrast=1.25:saturation=1.35',
  'insta pop': 'eq=saturation=1.5:contrast=1.2:brightness=0.05',
  'dreamy': 'eq=brightness=0.1:saturation=1.3,boxblur=2:1',
  'glow': 'eq=brightness=0.1:saturation=1.2,boxblur=2:1',
  'vintage film': 'colorchannelmixer=.6:.4:.2:0:.3:.5:.2:0:.2:.3:.4:0:0:0:1',
  'pixelate': 'scale=iw/20:ih/20,scale=iw*20:ih*20:flags=neighbor',
  'vignette': 'vignette=PI/4',
  'old tv': 'eq=saturation=0.8,noise=alls=20:allf=t+u',
  'faded': 'eq=brightness=0.05:saturation=0.75:contrast=0.85',
  'bright': 'eq=brightness=0.08',
  'dark': 'eq=brightness=-0.05:contrast=1.1',
  'contrast boost': 'eq=contrast=1.4',
  'soft fade': 'eq=brightness=0.08:contrast=0.9',

  // Cinematic tones - FIXED
  'cinematic teal': 'eq=saturation=1.2,hue=s=0.8:h=180',
  'matte film': 'eq=contrast=0.9:saturation=0.85',
  'aesthetic pink': 'eq=saturation=1.1,hue=s=1.0:h=330',
  'cool blue': 'eq=saturation=0.9,colortemperature=8000',
  'warm glow': 'eq=saturation=1.15,colortemperature=3500',
  'lowkey cinematic': 'eq=contrast=1.2:brightness=-0.08:saturation=0.85',

  // Vibrant social-style filters - FIXED
  'sunset': 'eq=saturation=1.3,hue=s=1.0:h=25',
  'forest green': 'eq=saturation=1.1,hue=s=1.0:h=120',
  'retro': 'eq=contrast=0.9:saturation=0.85,format=yuv420p',

  'grayscale': 'format=gray',
  'sepia': 'colorchannelmixer=.393:.769:.189:0:.349:.686:.168:0:.272:.534:.131',
  'negative': 'negate',
  'pastel': 'eq=contrast=0.9:saturation=0.8:brightness=0.1',

  // Dramatic looks - FIXED
  'moody shadows': 'eq=contrast=1.15:brightness=-0.1:saturation=0.9',
  'hdr punch': 'eq=contrast=1.5:brightness=0.05:saturation=1.4',
  'neon vibe': 'eq=saturation=2.2:contrast=1.1:brightness=0.05',
  'cold steel': 'eq=saturation=0.8,colortemperature=9000',
  'golden hour': 'eq=saturation=1.2,colortemperature=3000',

  // Creative effects
  'blurred dream': 'boxblur=5:1',
  'sharp focus': 'unsharp=7:7:2.5:7:7:2.5',
  'sketch': 'edgedetect=low=0.1:high=0.2,format=gray',
  'bw_high_contrast': 'format=gray,eq=contrast=1.5:brightness=0.05',
  'invert': 'lutrgb=r=negval:g=negval:b=negval',

  // Stylized cinematic moods - FIXED
  'teal shadow': 'eq=saturation=1.2,hue=s=0.9:h=180',

  'black & gold':
      'eq=saturation=0.6:contrast=1.3:brightness=-0.02,hue=s=0.8:h=45',
};
