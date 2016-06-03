From: Craig Gallek <kraigatgoog@gmail.com>
Subject: Re: [PATCH] soreuseport: add compat case for setsockopt SO_ATTACH_REUSEPORT_CBPF
Date: Fri, 3 Jun 2016 17:33:09 -0400
Message-ID: <CAEfhGiwwvwf31Dj+s0zA0bpVAZ4x4=rLuU5g217u=wRrgm07Dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Alexei Starovoitov <ast@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <netdev-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jun 3, 2016 at 5:09 PM, Helge Deller <deller@gmx.de> wrote:
> Any idea for a better naming than "do_sockopt_fix_sock_fprog()" ?
Thanks for catching and fixing this.  I'd suggest simply leaving the
function name as-is.  Your fix to the condition in that function is
sufficient to address the issue.

Craig
