From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] installation-reports - hppa c3600 graphical/usb
Date: Fri, 7 May 2004 21:16:24 +0200
Message-ID: <200405072116.25041.deller@gmx.de>
References: <20040506172344.GA12232@colo.lackof.org>
	<kfh7jvpbdnp.fsf@csclub.uwaterloo.ca>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_JC+mAat761QnlYJ"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <kfh7jvpbdnp.fsf@csclub.uwaterloo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_JC+mAat761QnlYJ
Content-Type: text/plain;
  charset="iso-8859-1";
  boundary=""
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 06 May 2004 20:42, James Morrison wrote:
> 
> Grant Grundler <grundler@parisc-linux.org> writes:
> > Comments/Problems:
> > 
> > Using the HP USB keyboard (Model SK-2502U, P/N A4983-60401) on an HP C3600,
> > the regular 4 arrow keys (seperate from the numeric keypad) do NOT work.
> > They "select" instead of moving the highlight up/down.
> > 
> > Use the numeric keypad instead - it has "arrow keys" on it as well.
> 
>  I have found that the "arrow keys" both move the highlight and select.
> This is from my experience on the console using bash on a B1K using some
> crappy usb keyboard.

The attached patch should fix the keyboard problem.
Any feedback welcome...

Helge


--Boundary-00=_JC+mAat761QnlYJ
Content-Type: text/plain;
  charset="iso-8859-1";
  name="diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="diff"

Index: drivers/input/keyboard/hpps2atkbd.h
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/input/keyboard/hpps2atkbd.h,v
retrieving revision 1.7
diff -u -p -r1.7 hpps2atkbd.h
--- a/drivers/input/keyboard/hpps2atkbd.h	20 Mar 2004 21:01:15 -0000	1.7
+++ b/drivers/input/keyboard/hpps2atkbd.h	7 May 2004 19:10:00 -0000
@@ -53,7 +53,7 @@
 /* 78 */  KEY_F11,      KEY_KPPLUS,    KEY_KP3,       KEY_KPMINUS,   KEY_KPASTERISK,KEY_KP9,      KEY_SCROLLLOCK,KEY_102ND,
 /* 80 */  KEY_RESERVED, KEY_RESERVED,  KEY_RESERVED,  KEY_RESERVED,  KEY_RESERVED,  KEY_RESERVED, KEY_RESERVED,  KEY_RESERVED,
 /* 88 */  KEY_RESERVED, KEY_RESERVED,  KEY_RESERVED,  KEY_RESERVED,  KEY_RESERVED,  KEY_RESERVED, KEY_RESERVED,  KEY_RESERVED,
-/* 90 */  KEY_RESERVED, KEY_RIGHTALT,  KEY_SYSRQ,     KEY_RESERVED,  KEY_RIGHTCTRL, KEY_RESERVED, KEY_RESERVED,  KEY_RESERVED,
+/* 90 */  KEY_RESERVED, KEY_RIGHTALT,  255,           KEY_RESERVED,  KEY_RIGHTCTRL, KEY_RESERVED, KEY_RESERVED,  KEY_RESERVED,
 /* 98 */  KEY_RESERVED, KEY_RESERVED,  KEY_RESERVED,  KEY_RESERVED,  KEY_RESERVED,  KEY_CAPSLOCK, KEY_RESERVED,  KEY_LEFTMETA,
 /* a0 */  KEY_RESERVED, KEY_RESERVED,  KEY_RESERVED,  KEY_RESERVED,  KEY_RESERVED,  KEY_RESERVED, KEY_RESERVED,  KEY_RIGHTMETA,
 /* a8 */  KEY_RESERVED, KEY_RESERVED,  KEY_RESERVED,  KEY_RESERVED,  KEY_RESERVED,  KEY_RESERVED, KEY_RESERVED,  KEY_COMPOSE,

--Boundary-00=_JC+mAat761QnlYJ
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_JC+mAat761QnlYJ--
