From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Comments?
Date: Wed, 23 Mar 2005 16:07:27 -0500 (EST)
Message-ID: <200503232107.j2NL7RPk026516@hiauly1.hia.nrc.ca>
References: <200503232053.j2NKrBsR026378@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 matthew@wil.cx
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503232053.j2NKrBsR026378@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Mar 23, 2005 03:53:11 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Here is a place in arch/parisc/kernel/signal.c where there is a
> problem with transferring a pointer:
> 
>           err |= __put_user(current->sas_ss_size, &frame->uc.uc_stack.ss_s
> 
> The type of ss_sp is void *.  There are also similar problems in
> kernel/signal.c (si_ptr and si_addr).  In this case, the current version
> of put_user will transfer 64-bits when using a hppa64 kernel.

I should have added that that the kernel should only transfer 32 bits in
this case.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
