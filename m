Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D0C94840
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Oct 2003 14:10:44 -0700 (MST)
Message-ID: <3F9C3854.80001@tiscali.be>
Date: Sun, 26 Oct 2003 21:10:44 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Joel Soete <soete.joel@tiscali.be>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110 builtin nic slow?
References: <3F9BFB00.5090008@tiscali.be> <20031026172531.GA32146@colo.lackof.org> <3F9C3154.4060105@tiscali.be>
In-Reply-To: <3F9C3154.4060105@tiscali.be>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hi Grant,

Sorry to answer to my mail but

> That say. I also try to re-do the same test with ncftp which seems to 
> show the same results excepted that 'put' from c110 to pc 'stail' after 
> only one hundred Kb (and I installed the same ftp server on each ie:
> ii  ftpd           0.17-16        FTP server
> ii  tftpd          0.17-10        Internet trivial file transfer 
> protocol serv).
> 

How may I find and reset the speed setup of a nic (I mean which 10 or 
100 Mb, half or full duplex)?

In a second though I just remember that the pc boot first (i need 
minicom console to boot c110) then latter the c110. So it could be that 
the first one is set in 100 half as default (no connection at boot time) 
and the second 10 half?

Thanks,
	Joel
