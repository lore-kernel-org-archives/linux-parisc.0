From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] sshd triggers Protection id trap
Date: Tue, 16 Jan 2007 12:57:09 +0100
Message-ID: <7d01f9f00701160357i795f7760t920b45c367939660__33088.9194309295$1416624264$gmane$org@mail.gmail.com>
References: <20070109034731.GD1065@athena.road.mcmartin.ca>
	<200701100205.l0A25XjX006906@hiauly1.hia.nrc.ca>
	<20070110222146.GD29244@colo.lackof.org> <45A7D875.9050309@scarlet.be>
	<7d01f9f00701141608t3af1fab5nd8819dea889cf956@mail.gmail.com>
	<7d01f9f00701141616y4e7726w4b7b59af0d270940@mail.gmail.com>
	<20070115003643.GD2687@athena.road.mcmartin.ca>
	<20070115042108.GE2687@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: "Kyle McMartin" <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070115042108.GE2687@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 1/15/07, Kyle McMartin <kyle@mcmartin.ca> wrote:
> On Sun, Jan 14, 2007 at 07:36:43PM -0500, Kyle McMartin wrote:
> > I'm seeing this too with 2.6.20-rc5 on SMP, I don't see it with -rc4, or when
> > booting a UP kernel. Will bisect to find what's going on.
>
> Try reverting this patch and see if it fixes your hanging boot problems...
> http://www.kernel.org/git/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=e5e5673f828623e58a401862b33173591faaeaff

Indeed, the box boots fine with that patch reverted.

HTH

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
