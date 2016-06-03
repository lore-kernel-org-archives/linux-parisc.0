From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [PATCH] soreuseport: add compat case for setsockopt
 SO_ATTACH_REUSEPORT_CBPF
Date: Fri, 3 Jun 2016 14:40:04 -0700
Message-ID: <20160603214002.GA58242@ast-mbp.thefacebook.com>
References: <CAEfhGiwwvwf31Dj+s0zA0bpVAZ4x4=rLuU5g217u=wRrgm07Dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Alexei Starovoitov <ast@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: Craig Gallek <kraigatgoog@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAEfhGiwwvwf31Dj+s0zA0bpVAZ4x4=rLuU5g217u=wRrgm07Dg@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jun 03, 2016 at 05:33:09PM -0400, Craig Gallek wrote:
> On Fri, Jun 3, 2016 at 5:09 PM, Helge Deller <deller@gmx.de> wrote:
> > Any idea for a better naming than "do_sockopt_fix_sock_fprog()" ?
> Thanks for catching and fixing this.  I'd suggest simply leaving the
> function name as-is.  Your fix to the condition in that function is
> sufficient to address the issue.

+1
and thanks for the fixes!
