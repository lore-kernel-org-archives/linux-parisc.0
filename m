From: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: [parisc-linux] Console/X problems on HCRX-24
Date: Tue, 15 Nov 2005 23:00:46 +0000
Message-ID: <20051115230046.GA5731@ntlworld.com>
References: <20051115195918.GA5640@ntlworld.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org,
 Johannes Raspe <j.raspe@t-online.de>,
 Andy Walker <ajwalker@broadpark.no>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051115195918.GA5640@ntlworld.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Nov 15, 2005 at 07:59:18PM +0000, Stuart Brady wrote:
> 3) X doesn't work properly in 32-bit mode.  It appears as though the X
>    server is using 24-bit pixels, but the HCRX-24 card is expecting
>    8-bits of padding per pixel...  So something like this:
> 
>    HCRX-24: R G B U|R G B U|R G B U|...
>    X:       R G B|R G B|R G B|R G B|...
> 
>    That's consistent with the colour 'artefacts' that I'm seeing.  BTW,
>    the right 1/4 of the screen is just whatever was left in the console
>    before switching to X.  I'll have a look at this one, but I expect
>    it's a bug in our STI code. :-(

Thanks to Max Grabert for the suggestion: adding the following line to
the "Screen" section in xorg.conf works for me:

	DefaultFbBpp	32

I would have expected the X server to be able to find this out for
itself, so I'm not sure if there's still a bug here.  I can't see
anything obviously wrong with stifb, fwiw.

Cheers,
-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
