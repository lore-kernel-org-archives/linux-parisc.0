From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: ls -l is broken
Date: Sun, 6 Apr 2008 16:42:04 -0600
Message-ID: <20080406224204.GE16451@parisc-linux.org>
References: <20080406222813.F11CA4E43@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080406222813.F11CA4E43@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Apr 06, 2008 at 06:28:12PM -0400, John David Anglin wrote:
> I just noticed that ls -l is broken:
> 
> dave@mx3210:~/gnu/gcc/gcc$ ls -l ltsugar.m4
> ls: ltsugar.m4: Operation not supported
> -rw-r--r-- 1 dave dave 4122 Mar 16 16:50 ltsugar.m4

If you strace it, what syscall returns -EOPNOTSUPP?

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
