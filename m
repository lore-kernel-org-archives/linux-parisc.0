Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp3.pp.htv.fi (smtp3.pp.htv.fi [213.243.153.135])
	by dsl2.external.hp.com (Postfix) with ESMTP id C044B4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Dec 2002 14:45:45 -0700 (MST)
From: Arto Jantunen <viiru@debian.org>
To: grundler@dsl2.external.hp.com (Grant Grundler)
Cc: "FARINATI,LEANDRO (HP-Brazil,ex1)" <leandro.farinati@hp.com>,
	"Parisc-Linux List (E-mail)" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] SMP on kernel version 19 pa 23
References: <9A0482A7BD2506488AD9417C93F3714FB4ABC3@xsp01.brazil.hp.com>
	<20021210192412.GB16933@dsl2.external.hp.com>
Date: Tue, 10 Dec 2002 23:45:35 +0200
In-Reply-To: <20021210192412.GB16933@dsl2.external.hp.com> (grundler@dsl2.external.hp.com's
 message of "Tue, 10 Dec 2002 12:24:12 -0700")
Message-ID: <87hedlwnsw.fsf@welho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

grundler@dsl2.external.hp.com (Grant Grundler) writes:

> On Tue, Dec 10, 2002 at 10:41:00AM -0800, FARINATI,LEANDRO wrote:
>> 	I would link to know if the SMP is working on kernel 19 pa 23, 32
>> bits?
>
> I assume you mean 2.4.19-pa23.
> IIRC 2.4.19-pa24 booted/worked on a500 (64-bit) and I thought that was
> an SMP kernel but aren't sure now.

The main thing here is that 32- and 64-bit SMP kernels are very
different. On a D390 a 32-bit kernel crashes on a lot of cases (I've
submited info on atleast three of those) and 64-bit kernel also
crashes, but in a very different way (and for very different reasons,
I'm quite sure). Lots of people have managed to run 64-bit SMP
kernels, I haven't heard of any succesful 32-bit SMP yet...

-- 
Arto Jantunen
