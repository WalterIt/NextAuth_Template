import Navbar from "./_components/navbar";
import { auth } from "@/auth"

interface ProtectedLayoutProps {
  children: React.ReactNode;
};

const ProtectedLayout = async({ children }: ProtectedLayoutProps) => {
  const session = await auth()

  return ( 
    <div className="h-full pt-32 w-full flex flex-col gap-y-10 items-center justify-center bg-[radial-gradient(ellipse_at_top,_var(--tw-gradient-stops))] from-sky-400 to-blue-800">
       <Navbar user={session?.user} />
      {children}
    </div>
   );
}
 
export default ProtectedLayout;