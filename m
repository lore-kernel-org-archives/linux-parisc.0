From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] -pie is broken on hppa
Date: Sat, 30 Jun 2007 12:54:55 -0400
Message-ID: <20070630165455.GA465__9495.00177889622$1416624401$gmane$org@fattire.cabal.ca>
References: <20070629072912.GC9495@fattire.cabal.ca>
	<200706301544.l5UFiDoG008907@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org,
 matthew@wil.cx
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200706301544.l5UFiDoG008907@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jun 30, 2007 at 11:44:13AM -0400, John David Anglin wrote:
> > Could you try this patch?
> 
> I installed it last night.  svn works, gcc bootstraps and I haven't
> seen any other problems.  There was a problem building libjava with
> the getdents bug.
>

OK. I'll try to build a HEAD kernel and boot with an old glibc to see if
it fucks up. Is there a really easy testcase I can try to reproduce
this?

> > -	/* struct linux_dirent has longs, like 'unsigned long d_ino' which
> > -	 * almost definitely should be 'ino_t d_ino' but it's too late now */
> 
> This is my only concern.
> 

It should be fine, since all other compat arches have the same problem.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
