Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 23FB5482B
	for <parisc-linux@parisc-linux.org>; Sat, 22 Mar 2003 20:37:57 -0700 (MST)
Message-Id: <200303230337.h2N3bhAC026836@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [Linux-ia64] Announce: modutils 2.4.24 is available
To: kaos@ocs.com.au (Keith Owens)
Date: Sat, 22 Mar 2003 22:37:43 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, linux-kernel@vger.kernel.org,
	parisc-linux@parisc-linux.org
In-Reply-To: <8755.1048390145@ocs3.intra.ocs.com.au> from "Keith Owens" at Mar 23, 2003 02:29:05 pm
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

> -#if defined(ARCH_ia64) || defined(ARCH_ppc64)
> +#if defined(ARCH_ia64) || defined(ARCH_ppc64) || defined(ARCH_hppa64)
>  #define HAS_FUNCTION_DESCRIPTORS
>  #endif

The 32-bit hppa port also has function descriptors.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
