Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dsl093-249-128.chi3.dsl.speakeasy.net (dsl093-249-128.chi3.dsl.speakeasy.net [66.93.249.128])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9AEE3482D
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Aug 2003 13:51:40 -0600 (MDT)
Date: Fri, 08 Aug 2003 15:51:43 -0400
Subject: Re: [parisc-linux] K360 with 64 bit kernel?
From: Richard Todd <rtodd@antipentium.com>
To: Joel Soete <joel.soete@tiscali.be>,
	Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: <parisc-linux@lists.parisc-linux.org>
Message-ID: <BB59778F.104%rtodd@antipentium.com>
In-Reply-To: <3F33FDA4.604@tiscali.be>
Mime-version: 1.0
Content-type: text/plain; charset="US-ASCII"
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

Gentoo is running fine in 64 bit on a few test boxes we have.
Irc.us.freenode.net #gentoo-hppa Gmsoft is the best source of help



On 8/8/03 3:44 PM, "Joel Soete" <joel.soete@tiscali.be> wrote:

> Gustavo Zacarias wrote:
> 
>> 
>> Hi.
>> Has anyone managed to boot a K360 with a 64 bit kernel?
>> The machine works just fine with a 32 bit one.
>> The problem is the machine getting stuck just after the ncr53c8xxx
>> driver with a bunch of scsi timeouts.
> 
> hmm could you launch a toc at this stage, after the reboot grab the
> piminfo and analyse it with dump_analayser.sh
> (available http://cvs.parisc-linux.org/build-tools/ with a.c too)
> 
> Thanks,
>   Joel
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
