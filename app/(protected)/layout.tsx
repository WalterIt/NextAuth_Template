import { currentUser } from "@/lib/custom-auth";
import Navbar from "./_components/navbar";

interface ProtectedLayoutProps {
  children: React.ReactNode;
};

const ProtectedLayout = async({ children }: ProtectedLayoutProps) => {
  const user = await currentUser()

  return ( 
    <div className="h-full pt-32 w-full flex flex-col gap-y-10 items-center justify-center bg-[radial-gradient(ellipse_at_top,_var(--tw-gradient-stops))] from-sky-400 to-blue-800">
       <Navbar user={user} />
      {children}
    </div>
   );
}
 
export default ProtectedLayout;