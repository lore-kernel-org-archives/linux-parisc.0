Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: =?iso-8859-1?Q?Dutot_St=E9phane?= <stephane.dutot@exlicite.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problem to compile kernel form CVS. 
In-Reply-To: Message from =?iso-8859-1?Q?Dutot_St=E9phane?= <stephane.dutot@exlicite.net>
   of "Mon, 25 Feb 2002 19:54:00 +0100." <02c001c1be2d$c97b20a0$9601a8c0@utopia>
References: <02c001c1be2d$c97b20a0$9601a8c0@utopia> 
Date: Mon, 25 Feb 2002 12:10:22 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020225191022.E27A54844@dsl2.external.hp.com>
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

=?iso-8859-1?Q?Dutot_St=E9phane?= wrote:
> make -C arch/parisc/kdb fastdep
...
> Have you some idea to solve this problem ?

Yes. Disable CONFIG_KWDB.

That was something I had worked on with the hope I would get permission
to publish the full source. Was never given that permission.
Piet Delaney (sp?) is working on a kernel debugger.

grant
