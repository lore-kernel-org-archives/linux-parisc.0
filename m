Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7A2A0482A
	for <parisc-linux@parisc-linux.org>; Wed,  5 Jun 2002 11:34:16 -0600 (MDT)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id g55HYEFN019375
	for <parisc-linux@parisc-linux.org>; Wed, 5 Jun 2002 13:34:14 -0400 (EDT)
Message-Id: <200206051734.g55HYDbd019373@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-cvs problem
To: joel.soete@freebel.net
Date: Wed, 5 Jun 2002 13:34:13 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <1023297439.3cfe479fcd5b9@webmail.tiscalinet.be> from "joel.soete@freebel.net" at Jun 5, 2002 07:17:19 pm
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

> But in that case I ignore what parameters I would have to use to configure and
> compile gcc natively. Can you still help me?

If you are using a 64-bit machine, you will have to specify "--host".  You
probably also want to specify "--prefix".  So, in your build directory,

${gcc_source_directory}/configure --prefix=${somewhere} --host=hppa-linux

This will configure the build for everything.  If you want just C, specify
"--enable-languages=c".  You may also want to specify where the assembler
and linker are if you don't want the defaults.  Type

${gcc_source_directory}/configure --help

for more option information.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
