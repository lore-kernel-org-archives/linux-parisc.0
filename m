Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 378AD4834
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Oct 2002 09:23:22 -0600 (MDT)
Date: Fri, 25 Oct 2002 08:26:21 -0700
From: Randolph Chung <randolph@tausq.org>
To: jsoe0708@tiscali.be
Cc: Stefan Pfetzing <dreamind@dreamind.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: mkfs.xfs (xfsprogs-2.3.5) failled
Message-ID: <20021025152620.GH22052@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20021024190027.GF5602@tausq.org> <3DB5776100000BBB@ocpmta8.be.tiscali.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DB5776100000BBB@ocpmta8.be.tiscali.com>
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

>  #define LDD_KERNEL(ptr) __get_kernel_asm("ldd",ptr)
>  #define LDD_USER(ptr) __get_user_asm("ldd",ptr)
> @@ -75,7 +75,7 @@
>  	    case 2: __get_kernel_asm("ldh",ptr); break; \
>  	    case 4: __get_kernel_asm("ldw",ptr); break; \
>  	    case 8: LDD_KERNEL(ptr); break;		\
> -	    default: BUG(); break;                      \
> +	    default: BUG(); __gu_err=ENOTSUP; break;    \
>  	    }                                           \
>  	}                                               \

this is wrong.

get_user is not defined to return an errno, just whether it's successful
or not.

i'll take a closer look this weekend.

randolph
