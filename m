From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Fwd: [BUG] 2.6.17 hangs on ppc/ia64/parisc and
	won't load init
Date: Mon, 24 Jul 2006 08:11:39 -0500
Message-ID: <200607240811.39468.mszick@morethan.org>
References: <7d01f9f00607232039g3d480198w7e206050bca36b0c@mail.gmail.com>
	<7d01f9f00607232041i620d523at60687f9392c3c8d0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: Thibaut VARENE <T-Bone@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00607232041i620d523at60687f9392c3c8d0@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun July 23 2006 22:41, Thibaut VARENE wrote:
> Hi pa-ckers,
> 
> Here's what I just sent to lkml
> 
> ----------
> 
> It was up for a few hours. 
> Interestingly, I experienced much longer uptimes with that 
> very same machine/kernel. 

Same compiler now as when you had the longer up-times?

I think there was an abi-event between parisc-3.3 & 3.4
re-compile with gcc-3.3 - see if your machine survives longer.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
