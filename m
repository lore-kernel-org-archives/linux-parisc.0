From: Craig Gallek <kraigatgoog@gmail.com>
Subject: Re: [PATCH] soreuseport: Fix reuseport_bpf testcase on 32bit architectures
Date: Fri, 3 Jun 2016 17:29:38 -0400
Message-ID: <CAEfhGiyS1Vk=etQcdu6n6NQDvOyc7zQC47PHi=0=8Z3HyvFxBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Alexei Starovoitov <ast@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	netdev <netdev@vger.kernel.org>, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <netdev-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jun 3, 2016 at 1:19 PM, Helge Deller <deller@gmx.de> wrote:
> This fixes the following compiler warnings when compiling the
> reuseport_bpf testcase on a 32 bit platform:
>
> reuseport_bpf.c: In function =E2=80=98attach_ebpf=E2=80=99:
> reuseport_bpf.c:114:15: warning: cast from pointer to integer of iffe=
rent size [-Wpointer-to-int-cast]
>
> Signed-off-by: Helge Deller <deller@gmx.de>
Acked-by: Craig Gallek <kraig@google.com>

Thanks!
