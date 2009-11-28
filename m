From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: convert /proc/pdc/{lcd,led} to seq_file
Date: Sat, 28 Nov 2009 08:45:08 -0600
Message-ID: <1259419508.4081.2.camel@mulgrave.site>
References: <20091127065112.GC26327@x200.malnet.ru>
	 <20091128061354.GA21113@lackof.org>  <20091128092509.GA4375@x200.malnet.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Grant Grundler <grundler@parisc-linux.org>, kyle@mcmartin.ca,
	akpm@linux-foundation.org, linux-parisc@vger.kernel.org
To: Alexey Dobriyan <adobriyan@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091128092509.GA4375@x200.malnet.ru>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 2009-11-28 at 12:25 +0300, Alexey Dobriyan wrote:
> On Fri, Nov 27, 2009 at 11:13:54PM -0700, Grant Grundler wrote:
> > On Fri, Nov 27, 2009 at 09:51:12AM +0300, Alexey Dobriyan wrote:
> > > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> > 
> > No commit comment?
> 
> No, subject says it's all.

He means rationale ... the output of the files you are altering is fixed
size and atomic, so we don't need seq_file for fear of running off the
fixed buffer and the data is reasonably fast changing, so anyone looking
to seek within the file because they can't read the data in one go isn't
going to get sensible results.  Given that, why bother with the
conversion?

James


