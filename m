Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 21D194829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Mar 2003 10:11:34 -0700 (MST)
Message-ID: <3E638F44.4070907@tiscali.be>
Date: Mon, 03 Mar 2003 17:22:12 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Randolph Chung <tausq@debian.org>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
References: <3E5F8012000005AB@ocpmta8.freegates.net> <200303031617.h23GHf1R027417@hiauly1.hia.nrc.ca> <20030303162440.GF11363@tausq.org>
In-Reply-To: <20030303162440.GF11363@tausq.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Randolph Chung wrote:

>[Note: trimmed cc list]
>
>  
>
>>Last time I tried (couple of weeks ago), it was possible to build
>>a 64-bit cross starting with 3.3.  This still doesn't work with 3.2.
>>    
>>
>
>also 64-bit hppa64-linux gcc-3.2 (built with 3.3) ICEs regularly. For
>people using this to build kernels, I would suggest staying with 3.0.4
>for now.
>
>(I'm also seeing reproducible crashes when running hppa64-linux-ld now,
>still need to track that down)
>
>randolph
>  
>
Ok Randolph, I will wait so because the question was in fact to rebuild 
a kernel 64bits with smp support (up works fine) but smp seems to 
failled just after init the first cpu and would like to see what is the 
problem.

Thanks for advise,  
    Joel
