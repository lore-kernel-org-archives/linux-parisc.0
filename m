From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] -pie is broken on hppa
Date: Sun, 3 Jun 2007 15:28:29 -0400
Message-ID: <20070603192829.GA23062__33764.4806168557$1416624383$gmane$org@fattire.cabal.ca>
References: <200706031606.l53G6d70012984@hiauly1.hia.nrc.ca>
	<200706031828.l53ISHsf015527@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org,
 matthew@wil.cx
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200706031828.l53ISHsf015527@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jun 03, 2007 at 02:28:17PM -0400, John David Anglin wrote:
> I believe that we aren't allowed to fault on the gateway page.
> If we have holes in the syscall table, I think we need a check
> for this since the following code will fault if r19 is zero:
> 
> .Lin_syscall:
>         ldil    L%syscall_exit,%r2
> 	be      0(%sr7,%r19)
> 	ldo     R%syscall_exit(%r2),%r2
> 

This is bad. Your kernel is too old, and glibc didn't take this into
account. I'll hack something up to return -ENOSYS.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
