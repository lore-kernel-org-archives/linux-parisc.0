From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Re: [parisc-linux] Support for 2.4.x kernels on hppa
Date: Mon, 24 May 2004 23:36:27 +0200 (MEST)
Message-ID: <200405242136.i4OLaRtN003029__23058.5327525207$1416623452$gmane$org@arbas.nms.ulrich-teichert.org>
References: <200405241937.i4OJbX07011585@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200405241937.i4OJbX07011585@hiauly1.hia.nrc.ca> from "John David
	Anglin" at May 24, 2004 03:37:33 PM
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

[del]
>Here is a little background on this issue.  Randolph has done a
>considerable amount of work to port libffi to the PA, and then add
>unwind and other support support to libjava.  This gives us a
>working Java implementation.  Thanks, Randolph!

Yupp, that's a step forward.

>This work is currently being integrated into GCC 3.5.  This is working
>well with 2.6, but we have problems with unwinding through signal
>frames on 2.4.  64-bit support is completely broken.  On at least
>some 32-bit kernels, we end up with hung processes that can bring
>the system to its knees.

Well, I could only speak for myself and my little boxes, and I would
say only do the absolute minimum required (like security fixes). Getting
new gcc 3.5 (or gdb) code to work, I would not count as necessary.

>We are having a little debate as to whether we need to support 2.4,
>given that GCC 3.5 probably won't be out for a year or so.

Just make it clear in the release notes and let the compile fail on
2.4 with an #error, IMHO. Does that sound too lazy ?-)

HTH,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de
Stormweg 24               |listening to: Noticable One (Rotten Apples)
24539 Neumuenster, Germany|Obstacle 1 (Interpol) Paranoia (N.Y. Rel-X)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
