Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] TOC on B180L 
In-Reply-To: Message from joel.soete@freebel.net
   of "Thu, 14 Mar 2002 07:54:29 +0100." <1016088869.3c904925683bb@webmail.tiscali.be>
References: <1016088869.3c904925683bb@webmail.tiscali.be> 
Date: Thu, 14 Mar 2002 00:29:13 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020314072913.848494886@dsl2.external.hp.com>
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
> On my B180L the TOC blue button is located (on the back of the 'server') just
> between the keyboard connector and the video connector. (On all we have here,
> the button is located at the same place).

thanks - should be the same place for all B-xxx machines.

> PS: Is this interrupt will be consider as a hardware reset by linux kernel?

I don't know...I expect it be treated like an HPMC (or NMI)...which
depending on how the HW has locked up...
