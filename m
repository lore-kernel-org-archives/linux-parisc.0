From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] No "#/'" and "<>|" keys with german HIL-keyboard
Date: Sun, 31 Oct 2004 19:20:33 +0100
Message-ID: <200410311920.33777.deller@gmx.de>
References: <200410311421.17271.j.raspe@t-online.de>
	<200410311527.03160.deller@gmx.de>
	<200410311835.53401.j.raspe@t-online.de>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_xzShBLHI9PMAuS2"
Cc: parisc-linux@lists.parisc-linux.org
To: Johannes Raspe <j.raspe@t-online.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200410311835.53401.j.raspe@t-online.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_xzShBLHI9PMAuS2
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

Hi Johannes,

On Sunday 31 October 2004 18:35, Johannes Raspe wrote:
> > On Sunday 31 October 2004 14:21, Johannes Raspe wrote:
> > > after successfully moving to kernel 2.6.x-series with great help from
> > > Helge Deller I'd like to report a problem wich is also present in
> > > 2.4.x-kernels: with my german HIL-keyboerd on a 735/125 the keys for
> > > "#/'" (between left shift-key and the "y"-key) and "<>|" (between Return
> > > and the german "ä"-key) give absolutely no response to the OS.
> > > I tried "showkey" on a text-console and nothing happens when pressing
> > > these two keys. Every other key gives an output.
> >
> > please apply the following patch and send me the documented console-output
> > for the corresponding keys.
> >
> Output for "<"-key:
> HIL_POL_CHARTYPE_SET1: 118
> 
> Output for "#"-key:
> HIL_POL_CHARTYPE_SET1: 116

please try the attached patch.
Helge

--Boundary-00=_xzShBLHI9PMAuS2
Content-Type: text/plain;
  charset="iso-8859-15";
  name="diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="diff"

Index: include/linux/hil.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/linux/hil.h,v
retrieving revision 1.8
diff -u -p -r1.8 hil.h
--- include/linux/hil.h	27 Jan 2004 22:36:57 -0000	1.8
+++ include/linux/hil.h	31 Oct 2004 18:18:50 -0000
@@ -422,7 +422,7 @@ enum hil_command {
    KEY_J,		KEY_K,		KEY_L,		KEY_SEMICOLON,	\
    KEY_APOSTROPHE,	KEY_ENTER,	KEY_HOME,	KEY_PAGEUP,	\
    KEY_M,		KEY_COMMA,	KEY_DOT,	KEY_SLASH,	\
-   KEY_RESERVED,	KEY_SELECT,	KEY_RESERVED,	KEY_PAGEDOWN,	\
+   KEY_BACKSLASH,	KEY_SELECT,	KEY_102ND,	KEY_PAGEDOWN,	\
    KEY_N,		KEY_SPACE,	KEY_NEXT,	KEY_RESERVED,	\
    KEY_LEFT,		KEY_DOWN,	KEY_UP,		KEY_RIGHT
 

--Boundary-00=_xzShBLHI9PMAuS2
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_xzShBLHI9PMAuS2--
