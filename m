From: Stuart Brady <sdbrady@ntlworld.com>
Subject: [parisc-linux] stifb problem on a 715/100 - sti= parameter broken?
Date: Mon, 23 Aug 2004 13:37:36 +0100
Message-ID: <20040823123736.GA765@calypso>
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

Hi,

I can't get the console to work on a 715/100.  The console path is set
to "graphics.9" which refers to the built-in hardware.  There's an
HCRX-24 card attached (graphics_1), but I don't have a monitor for that.

PALO chooses sti=1, and 2.4 kernels work fine with sti=1.  If I boot
with sti=0, I last thing I see is the "If this is the last message you
see, you may need to switch your console" message, which is expected
since it's presumably using the HCRX card for output.

If I boot a 2.6 kernel, I get the "If this is the last message you see"
message regardless of what sti is set to.  Does anyone know what I'm
doing wrong?  I've searched the lists, but I haven't found anything yet
except for references to a similar problem in 2.4 in 2001-2002.

"cat /dev/fb0 > /dev/fb1" copies console text to the screen, so it seems
that the framebuffer is working correctly, but the wrong device is being
used for the console.

Thanks,
-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
