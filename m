Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Message-ID: <3FAD863B.8010609@tiscali.be>
Date: Sun, 09 Nov 2003 00:11:39 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] evolution (1.4.5-1) 'protection id trap' [was:
 do_page_fault?]
References: <3F969FFE00005DB3@ocpmta2.freegates.net> <3FACE5A4.7070003@tiscali.be> <20031108223304.GB28929@colo.lackof.org>
In-Reply-To: <20031108223304.GB28929@colo.lackof.org>
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


Grant Grundler wrote:
> On Sat, Nov 08, 2003 at 12:46:28PM +0000, Joel Soete wrote:
> 
>>But if I launch it a second time no more pb???
>>Very strange isn't it?
> 
> 
> Sounds like a cache coherency/aliasing problem.
> Once you start looking at code, watch out for module loading
> and shared memory maps type stuff.
> 
> grant
> 
Thanks Grant,

I have to put it in my todo list (sorry not enough time in a day)

Joel
