From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Testing the lws_compare_and_swap_2 syscall
Date: Tue, 24 Oct 2017 21:48:15 -0400
Message-ID: <F232B09A-5367-4A4C-B731-00C63AAB489A@bell.net>
References: <1508874207@msgid.manchmal.in-ulm.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1508874207@msgid.manchmal.in-ulm.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-10-24, at 4:03 PM, Christoph Biedl wrote:

> To start with, using the invalid value 4 as size parameter does not
> return ENOSYS as I'd expect but crashes my system[2], using both 32 and
> 64 bit kernel, no root privileges required.

        /* Check the validity of the size pointer */
        subi,>>= 4, %r23, %r0
        b,n     lws_exit_nosys

The condition in the subi instruction should be ">>".  The branch is incorrectly nullified when
%r23 is 4.

Dave
--
John David Anglin	dave.anglin@bell.net



