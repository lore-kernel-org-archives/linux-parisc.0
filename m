Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA14058
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Aug 2000 07:42:26 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 21 Aug 2000 13:42:16 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@thepuffingroup.com,
        parisc@lists.linuxcare.com
Subject: Re: Incompatibility of PIC and non-PIC
References: <Pine.LNX.4.21.0008201351070.26467-100000@front.linuxcare.com.au>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 21 Aug 2000 09:41:18 -0400
In-Reply-To: Alan Modra's message of "Sun, 20 Aug 2000 14:19:05 +1000 (EST)"
Message-ID: <877l9azq81.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra <alan@linuxcare.com.au> writes:

> I haven't found one, and it's a real pain.  I tend to edit patches
> covering multiple directories before passing them to patch.
> 
> "sed -e '/^[+-][+-]/d' < cvs_diff_file | patch -p0 --posix" ought to work.

Here's a tiny Perl script I wrote for this purpose once in a fit of
pique.  Use the -i option to specify the 'input' directory prefix
(i.e. in the --- line) and -o to specify the 'output' directory
prefix.

#!/usr/bin/perl -p
use strict;
use File::Basename;
use vars qw($in $out $path $name $dir);

BEGIN {
    my @args;
    while (defined($_ = shift)) {
	if (/-i/) {
	    $in = shift;
	    $in =~ s,$,/,;
	    $in =~ tr,/,,s;
	} elsif (/-o/) {
	    $out = shift;
	    $out =~ s,$,/,;
	    $out =~ tr,/,,s;
	} else {
	    push @args, $_;
	}
    }
    $out ||= $in;
    $in  ||= $out;
    @ARGV=@args;
}

/^Index: (.*)/ and do {
    ($name, $dir) = fileparse($1);
};
/^(---|\+\+\+) ([^\t]+)/ and do {
    die "Your CVS isn't broken, $2 doesn't match $name\n" unless $2 eq $name;
    my $prefix = ($1 eq '---') ? $in : $out;
    s,$2,${prefix}${dir}${name},;
};


-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
