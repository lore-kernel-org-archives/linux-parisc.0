From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] DIFF use 6-regs in copy_user_page_asm
Date: Tue, 4 Jan 2005 00:29:40 -0800
Message-ID: <20050104082940.GF18497@tausq.org>
References: <20050103061910.GJ15061@colo.lackof.org>
	<20050104061342.GE18497@tausq.org> <1104826986.8221.8.camel@beavis>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Ryan Bradetich <rbradetich@uswest.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1104826986.8221.8.camel@beavis>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Is this something that would benefit older processors? Say a PCX-T
> processor?  Is this something worth testing?  I'm pretty sure I 
> have a PCX-T processor around I could boot up and test.

i have no idea, but we can test it and see. i've read some pdfs which
suggest that all pa20 processors can do this reordering, but i don't
know about pa11 processors. in any case, empirical results are always
better than speculation :)

randolph
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
