Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3EE794879
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Nov 2003 09:26:57 -0700 (MST)
Message-ID: <3FB10DCF.3050505@tiscali.be>
Date: Tue, 11 Nov 2003 16:26:55 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
References: <20031111010956.6EE2A49402D@palinux.hppa> <20031111011234.GA29854@colo.lackof.org>
In-Reply-To: <20031111011234.GA29854@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Re: [parisc-linux-cvs] 2.4.22-pa15 DIFF
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


Grant Grundler wrote:
> On Mon, Nov 10, 2003 at 06:09:56PM -0700, Grant Grundler wrote:
> 
>>Log message:
>>2.4.22-pa15 revert __put_kernel_asm64 to static inline function
>>
>>my bad. I overlooked this when committing the code.
>>I prefer inline functions over macros for type checking/covercion.
>>I don't like the use of "R2" for upper half of u64 data type
>>since it's easy to overlook and not commonly used in parisc port.
> 
That was just why I posted it as a _remainder_, an 'interesting' stuff 
not usual (I spent a lot of time to find how to do with hppa as it was 
done on other platform). But I agree that confused even the best :)

Thx,
	Joel
