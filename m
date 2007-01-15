From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] sshd triggers Protection id trap
Date: Sun, 14 Jan 2007 19:36:43 -0500
Message-ID: <20070115003643.GD2687__13758.4828109995$1416624263$gmane$org@athena.road.mcmartin.ca>
References: <20070109034731.GD1065@athena.road.mcmartin.ca>
	<200701100205.l0A25XjX006906@hiauly1.hia.nrc.ca>
	<20070110222146.GD29244@colo.lackof.org>
	<45A7D875.9050309@scarlet.be>
	<7d01f9f00701141608t3af1fab5nd8819dea889cf956@mail.gmail.com>
	<7d01f9f00701141616y4e7726w4b7b59af0d270940@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00701141616y4e7726w4b7b59af0d270940@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jan 15, 2007 at 01:16:00AM +0100, Thibaut VARENE wrote:
> 
> I don't know if that's related but it seems that 1 out of 2 boot
> attempts the kernel doesn't get past the startup of INIT and freezes
> there. I don't think this is my 'ldap' bug because this box is
> properly configured to avoid it. Something else is happening I
> suppose....
> 

I'm seeing this too with 2.6.20-rc5 on SMP, I don't see it with -rc4, or when
booting a UP kernel. Will bisect to find what's going on.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
