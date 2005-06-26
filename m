From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: [parisc-linux] AD1889 Support (yes it's there!)
Date: Sun, 26 Jun 2005 02:26:15 +0200
Message-ID: <20050626022615.15d0ccbb@Tatooine.r3z0>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
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

Fellow pa-ckers,

Some of you have been wondering whether they'll be able to enjoy quality
music playback on their AD1889-enabled PA-RISC machines one of these days
(BCJ-X000 class machines, basically).

Well, be happy, dance around, that day has come! ;)

The recent commits to the CVS have brought in a now really decent AD1889
driver, supporting full duplex playback and capture.

It works absolutely fine in OSS emulation mode. So far we have a bug with
the ALSA native mode, which produces unintelligible sound.[1]

Oh, don't use mpg123, madplay, ogg123 (and probably anything not properly
catching ctrl-C), because if you interrupt the playback before the end of
the file with Ctrl-C, you'll be playing russian roulette, with
statistically good chances of not surviving it. :)

This could be a bug in our signal handling code, because XMMS works just
fine for instance. sox works fine as well.

So my 2c is "use XMMS" or wait for the EOF in playback, with OSS
emulation, and use sox to record :)

More info at http://wiki.parisc-linux.org/AD1889

[1] For those interested, it appears that if you run something like:

while :; do cat /proc/asound/AD1889/AD1889; done

while playing something in native ALSA mode, it would somehow work. The
above reads registers on the card, but I don't know if that a PCI posting
issue, a timing issue, or something else. It's pretty strange since we
fully comply to the ALSA API (to the best of our knowledge, at least).

HTH

-- 
Thibaut VARENE
The PA/Linux Team
http://wiki.parisc-linux.org/ThibautVarene
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
