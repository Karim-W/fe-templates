import type { MetaFunction } from "@remix-run/node";

export const meta: MetaFunction = () => {
  return [
    { title: "{{.APP_NAME" },
    { name: "", content: "" },
  ];
};

export default function Index() {
  return (
    <div className="flex flex-col h-screen w-screen items-start justify-start p-4 gap-4">

    </div>
  );
}

