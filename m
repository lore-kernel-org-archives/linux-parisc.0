From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH] arch: parisc: kernel: sys_parisc:  Remove some unused
 functions
Date: Fri, 2 Jan 2015 18:14:08 +0000
Message-ID: <20150102181408.GT22149@ZenIV.linux.org.uk>
References: <1420222190-32621-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	James Hogan <james.hogan@imgtec.com>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1420222190-32621-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 02, 2015 at 07:09:50PM +0100, Rickard Strandqvist wrote:
> Removes some functions that are not used anywhere:
> parisc_personality() parisc_fallocate() parisc_sync_file_range()
> parisc_fadvise64_64() parisc_readahead() parisc_pwrite64() parisc_pread64()
> parisc_ftruncate64() parisc_truncate64()
> 
> This was partially found by using a static code analysis program called cppcheck.

... which program has ended up missing
#define ENTRY_OURS(_name_) .word parisc_##_name_
and tons of lines like this
        ENTRY_OURS(sync_file_range)
in arch/parisc/kernel/syscall_table.S
