Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Phil Anderson <andersop@neverland.ncssm.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Missing beep... and music too 
In-Reply-To: Message from Phil Anderson <andersop@neverland.ncssm.edu>
   of "Thu, 04 Apr 2002 20:39:55 EST." <Pine.LNX.4.33.0204042038090.29216-100000@bob.ncssm.edu>
References: <Pine.LNX.4.33.0204042038090.29216-100000@bob.ncssm.edu> 
Date: Thu, 04 Apr 2002 22:54:15 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020405055415.C6C54482B@dsl2.external.hp.com>
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

Phil Anderson wrote:
> I think the problem lies in my mpg321, because no matter what I do with 
> it, use esd or not, whatever options I choose - I always get the
> Illegal Instruction
> error. this is the mpg321 .deb I installed of  my 0.9.3 CD; could the 
> mpg321 be corrupt or is something else wrong? 

I'm wondering if it's something else.

712/80i was one of the few systems that was sold w/o Floating Pointing
coprocessor (or FP was disabled) at a lower price point. I believe
parisc-linux kernel ignores the lies that PDC presents about the FP
not being present. But I'm wondering if something is really
disabled on the chip that causes FP to just not work.  I don't know
if our FP emulation will deal with a completely missing FP Unit.

If this really the case, I should be able find you a real 712/80
to play with. But you need to figure out what is causing the
illegal instruction first.

grant
