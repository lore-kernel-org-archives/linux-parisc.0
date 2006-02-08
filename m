From: Andy Walker <ajwalker@broadpark.no>
Subject: Re: [parisc-linux] RAM for C200 and J5600
Date: Wed, 08 Feb 2006 10:49:07 +0100
Message-ID: <2780df10f34a59915f7718b92f24ee10@localhost>
References: <20060208063323.GT19232@lug-owl.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <20060208063323.GT19232@lug-owl.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org




On Wed, 08 Feb 2006 07:33:24 +0100, Jan-Benedict Glaw <jbglaw@lug-owl.de> wrote:
> Hi!
> 
> I recently got two C200 (thanks Frank!) and I'll probably soon get a
> J5600. Unfortunately all machines are without any RAM. What kind of
> RAM do I need for these machines? Can I transplant RAM from a 712/50,
> a B132L, 735 or 715? Though that's probably not a nice solution, I do
> have these machines used for Linux hacking, but that's probably better
> than no RAM at all :->
> 
> Thanks, JBG

B132L RAM should be fine in the C200s. These are the "new" 72pin ECC SIMMs.

712 and 715 have "old" 72pin SIMMS. The 735 has some weird and ancient
modules used only in 720/730/735/750/755.

I've got a pile of 16MB modules for B/C/D class at home. I could probably
send some to Germany (from Norway) if you're interested. Mail me off-list.

>>From the J5600 info:

Memory
    * 278-pin 120MHz ECC SDRAM DIMMs
    * Takes 256/512/1024MB modules
    * J5000: 8 slots
    * 256MB (1*256) minimum, J5000: 8GB (8*1024) maximum

-Andy

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
