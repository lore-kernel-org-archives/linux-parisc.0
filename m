Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC40348D7
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Mar 2003 09:36:29 -0700 (MST)
Message-Id: <200303201636.h2KGaNqW026825@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] RE: 64 bit userspace
To: leandro.farinati@hp.com (FARINATI, LEANDRO)
Date: Thu, 20 Mar 2003 11:36:23 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <9A0482A7BD2506488AD9417C93F3714F01FC0A0F@xsp01.brazil.hp.com> from "FARINATI,LEANDRO" at Mar 20, 2003 11:08:59 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Leandro,

> 	I ask you again about what is necessary to develop the 64 bit
> userspace to run applications because maybe HP could give some suport to
> finish this.
> 	I try to get some HP help, but to do this I will give them a
> detailed report with what is necessary to develop 64 bit userspace and how
> to do this (kernel changes, user space and application frame work). 
> 	What informations is needed to follow the work.
> 	However, any help and information is welcome to I finish this report
> and try to get HP help.

If you are going to take the lead in generating this report, I think
it would work better if you posted what you have and asked for comments.
Just feeding information into a blackhole isn't very interesting.

As I see it, this will only move forward if there is sufficient
interest in the community.  You lose about 10% in performance in
the average program moving to 64-bits.  So, you only want to go to
64-bits if you have a need to run large applications.  This need
may exist in commercial and scientific computing, but it's not
important to the average volunteer software developer.  If HP wants
to get the port moving in this direction, there needs to be a
carrot.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
