From: Stuart Brady <sdbrady@ntlworld.com>
Subject: [parisc-linux] AD1889 OPL3 Synthesis
Date: Sun, 26 Jun 2005 15:53:54 +0100
Message-ID: <20050626145353.GA2566@ntlworld.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I thought I'd explain what's needed to get the AD1889's OPL3 synthesis
working.  (BTW, OPL3 synthesis is pretty primative.)

ALSA provides everything needed to use the OPL3 device.  Most drivers
initialise the hardware if necessary, and then call snd_opl3_create()
followed by snd_opl3_hwdep_new().  snd_opl3_free() is automatically
called by the ALSA layer when the module is unloaded, so there's no need
to call it explicitly.

snd_opl3_create() takes port addresses, so I've had to add a new
function, snd_opl3_create_mapped().  This isn't in mainline 2.6.12 yet.

I'm not happy with the snd_opl3_create_mapped() interface yet...  The
AD1889 driver maps the region containing the OPL3 registers, but the
OPL3 driver does the iounmap().  I've been told that this is the right
way to do it, but it still seems broken.

There should only be one change needed to get the AD1889 OPL3 support
working though.  The DS_SYDA register has to be set, so that it's not
muted, and that the attenuation is set reasonably.  Which is either:

	ad1889_writew(chip, AD_DS_SYDA, 0x3f3f);
	ad1889_readw(chip, AD_DS_SYDA);

or the constant should be 0x0000 rather than 0x3f3f.

I used playmidi for testing.  There are some example MIDI files:
/usr/share/doc/playmidi/examples/*.mid.gz.  Unfortunately, ALSA's OPL3
code has some bugs which affect the quality of the music produced.
Also, playmidi's instruments need some work.

I was getting silence when testing before, but it otherwise appeared to
be working.  There's probably a mixer channel associated with the OPL3
(or SYN, see below) which must be used.  I have no idea which this is.

It seems that if the SYEN bit in the DS_WSMC register is set, this
enables a secondary wave channel (which is called SYN, just to be
confusing) and _disables_ the OPL3 - which results in an HPMC if an
attempt is made to use the OPL3's registers.

The RES channel appears to be take the output of the SYN channel or the
OPL3 (whichever is enabled), resampling it at the rate specified by the
DS_RES register.  It looks as though the SYN channel's sample rate and
format is always that of the WAV channel, which limits its use.
-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
