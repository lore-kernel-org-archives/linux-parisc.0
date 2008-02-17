From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: How to grab begining/end functions' address? [Wa: 'Trace patches test' ]
Date: Sun, 17 Feb 2008 07:17:43 -0700
Message-ID: <20080217141742.GC21012@parisc-linux.org>
References: <JV1SEX$ACF9E213A9B966069761EDBBFFD7BB89@scarlet.be> <20080123071343.GD20348@colo.lackof.org> <47B811EC.3080707@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: rubisher <rubisher@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <47B811EC.3080707@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Feb 17, 2008 at 10:52:28AM +0000, rubisher wrote:
> Has far as the gcc builtin instrument-functions doesn't work as I expected, 
> I would like to grab manually the address of the functions' begin and end 
> like something:
> void foo(){
> foo_start:
> 	printk ("%s() start at %p.\n, __FUNCTION__, 
> 	???ADDRESS_OF???(foo_start);
> [snip]
> foo_end:
> 	printk ("%s() start at %p.\n, __FUNCTION__, 
> 	???ADDRESS_OF???(foo_end);
> };
> 
> It seems to me that I read it something like this in the past but no means 
> to remember how to do it.

The kernel already has code to do this -- look at the stack backtraces.
They show addresses, function names and length of the function.  Start
by looking at BUG() and trace through to find out how the kernel does
this.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
