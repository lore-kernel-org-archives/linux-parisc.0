Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id C6C68482D
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Aug 2003 13:44:46 -0600 (MDT)
Message-ID: <3F33FDA4.604@tiscali.be>
Date: Fri, 08 Aug 2003 19:44:36 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] K360 with 64 bit kernel?
References: <3F33E1F8.9030706@zacarias.com.ar>
In-Reply-To: <3F33E1F8.9030706@zacarias.com.ar>
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

Gustavo Zacarias wrote:

>
> Hi.
> Has anyone managed to boot a K360 with a 64 bit kernel?
> The machine works just fine with a 32 bit one.
> The problem is the machine getting stuck just after the ncr53c8xxx 
> driver with a bunch of scsi timeouts. 

hmm could you launch a toc at this stage, after the reboot grab the 
piminfo and analyse it with dump_analayser.sh
(available http://cvs.parisc-linux.org/build-tools/ with a.c too)

Thanks,
    Joel
