From: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: [parisc-linux] AD1889 OPL3 Synthesis
Date: Sun, 26 Jun 2005 16:45:01 +0100
Message-ID: <20050626154500.GA2704@ntlworld.com>
References: <20050626145353.GA2566@ntlworld.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050626145353.GA2566@ntlworld.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jun 26, 2005 at 03:53:54PM +0100, Stuart Brady wrote:
> I used playmidi for testing.  There are some example MIDI files:
> /usr/share/doc/playmidi/examples/*.mid.gz.  Unfortunately, ALSA's OPL3
> code has some bugs which affect the quality of the music produced.
> Also, playmidi's instruments need some work.
> 
> I was getting silence when testing before, but it otherwise appeared to
> be working.  There's probably a mixer channel associated with the OPL3
> (or SYN, see below) which must be used.  I have no idea which this is.

I forgot to mention -- there seems to be another bug in ALSA: before you
can play anything, you'll have to run:

    cat /proc/asound/seq/clients

I've no idea why, and I haven't got around to reporting it to the ALSA
developers yet.  If you don't do this, you'll see:

    playmidi: No playback device found.

Also, if you try to play the example MIDI files using playmidi, without
gunzipping them first, playmidi will just segfault.

BTW, playmidi produces better sound if it is passed the "-4" option, but
this reduces the number of notes that can be played simultaneously.

You could also try using pmidi, which doesn't rely on OSS emulation,
although this didn't work for me.

If anyone's looking for a more sensible way to play MIDI files, I would
suggest using TiMidity++, which doesn't use OPL3.

Cheers,
-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
