Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-3.2 failed to compile kernel 
In-Reply-To: Message from joel.soete@freebel.net
   of "Wed, 26 Jun 2002 15:32:22 +0200." <1025098342.3d19c266a0ff7@webmail.tiscalinet.be>
References: <1025098342.3d19c266a0ff7@webmail.tiscalinet.be> 
Date: Wed, 26 Jun 2002 08:25:16 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020626142516.87E52485B@dsl2.external.hp.com>
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

joel.soete@freebel.net wrote:
> In file included from pacache.S:44:
> /Develop/parisc-linux/src/linux-2.4.18-pa40/include/asm/cache.h:9: 1/config.h
>   :
> No such file or directory

The offending line is:
      8 #include <linux/config.h>

I'll assume "linux" being #define'd to 1.
gcc predefines perhaps?

grant
