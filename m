From: "Andy Walker" <ajwalker@broadpark.no>
Subject: [parisc-linux] Re: STI crash on B132L with HCRX-24
Date: Tue, 26 Oct 2004 09:52:24 +0200 (CEST)
Message-ID: <15238.193.160.141.5.1098777144.squirrel@193.160.141.5>
References: <200410031355.12116.j.raspe@t-online.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux@parisc-linux.org
To: "Johannes Raspe" <j.raspe@t-online.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200410031355.12116.j.raspe@t-online.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Hi Andy,
>
> did you find a solution for the stifb-problem?
> I encounter the same problem with a 735/125 with CRX24 graphics. Kernel
> 2.4.27
> works fine, any 2.6.x-kernel I tried gives me a hang.
>
> Johannes
>
> --


Hi Johannes & PA,

Johannes dragged up this old mail of mine as he has been having FB
related problems with CRX24 on his 735/125.

In my case, 32bpp FB on HCRX24 (Hyperbowl) on my B132L stopped working
at the time the FB reorganization patches went into the early 2.6
kernels. I have successfully been running 2.6.7-pa1 in 8bpp though.

Last night I compiled and booted 2.6.9-pa1. FB is totally hosed also
in 8bpp now. When the kernel switches to FB the screen gets "splattered"
with blue and red buffer debris and the machine hangs.

Looks like CRX/HCRX is suffering from chronic bitrot, possibly exarcebated
by the ia32/ia64-centric FB patches that have been going in lately.

So, is there anyone (Helge?) who has time and knowledge to look into
this? I can boot the B132L with the console on Vis-EG and torture the
HCRX24 on fb1 if that helps, but some clues would be good.

-Andy


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
